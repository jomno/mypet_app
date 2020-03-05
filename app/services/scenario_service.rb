# yes_symptoms = 유증상의 id ary
# no_symptoms = 증상 없음의 id ary
# remain_yes_symptoms = 남아있는 유증상 리스트
# remain_no_symptoms = 남아있는 무증상 리스트
# next_symptom = 남아있는 검사할 기능
# solution = 이 케이스의 답
class ScenarioService
    attr_accessor :yes_symptoms, :no_symptoms, :remain_yes_symptoms, :remain_no_symptoms, :next_symptom
    attr_reader :solution

    def initialize(yes_symptoms, no_symptoms = [])
        @yes_symptoms = *yes_symptoms
        @no_symptoms = no_symptoms
        @remain_yes_symptoms = []
        @remain_no_symptoms = []
        get_remain_symptoms
        get_next_symptom
    end

    def solution
        if remain_yes_symptoms == [] && remain_no_symptoms == []
            remain_solutions.first
        end
    end

    private

    def ary_comp(ary)
        ary.inject { |comp, x| comp & x }
    end

    def remain_solutions
        solution_ids = []
        yes_symptoms.each do |yes_symptom|
            solution_ids << Solution.includes(:taggings).where(taggings: {symptom_id: yes_symptom, status: 0}).ids
        end

        no_symptoms.each do |no_symptom|
            solution_ids << Solution.includes(:taggings).where(taggings: {symptom_id: no_symptom, status: 1}).ids
        end

        solution_ids = ary_comp(solution_ids)
        
        Solution.where(id: solution_ids)
    end

    def remain_solution
    end

    def get_remain_symptoms
        remain_solutions.all.each do |solution|
            @remain_yes_symptoms << solution.yes_symptoms.ids
            @remain_no_symptoms << solution.no_symptoms.ids
        end
        
        @remain_yes_symptoms&.flatten!&.uniq!
        @remain_no_symptoms&.flatten!&.uniq!

        @remain_yes_symptoms -= yes_symptoms
        # @remain_yes_symptoms -= no_symptoms
        
        # @remain_no_symptoms -= yes_symptoms
        @remain_no_symptoms -= no_symptoms
    end

    def get_next_symptom
        if remain_yes_symptoms.present?
            @next_symptom = remain_yes_symptoms.first
        elsif remain_no_symptoms.present?
            @next_symptom = remain_no_symptoms.first
        end
    end


    # def remain_yes_symptoms
    #     @remain_yes_symptoms
    # end

    # def remain_yes_symptoms = (val)
    #     @remain_yes_symptoms = val
    # end

    # def remain_no_symptoms
    #     @remain_no_symptoms
    # end

    # def remain_no_symptoms = (val)
    #     @remain_no_symptoms = val
    # end
end