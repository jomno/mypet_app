ActiveAdmin.register_page "Dashboard" do
  content title: "대시보드" do
  end
end



      # column do
      #   div class: :row do
      #     panel "첨삭 및 ANSWER 처리 현황", class: "pagintion_panel" do
      #       div class: "blank_slate_container", id: "dashboard_default_message" do
      #         total_sheet = Sheet.wait.order("wait_at DESC")
      #         table_for(total_sheet, class: '', id: "sheet_user") do |f|
      #           column "부문" do |object|
      #             I18n.t("custom.#{object.sheet_type}") if object.sheet_type.present?
      #           end
      #           column "제출시간" do |object|
      #             time_ago_in_words(object.wait_at) + " 전 "
      #           end
      #           column "상태" do |object|
      #             I18n.t("custom.#{object.status}")
      #           end
      #           column "배정된 선생님" do |object|
      #             (status_tag "미배정")
      #           end
      #           column "제출자 ID" do |object|
      #             object.student.email
      #           end
      #         end
      #       end
      #     end
      #
      #     panel "선생님 근무 시간", class: "pagintion_panel"  do
      #       div class: "blank_slate_container", id: "dashboard_default_message" do
      #         table_for(User.teacher, class: '', id: "essat_teacher") do |cr|
      #           column "선생님 email" do |t|
      #             t.email
      #           end
      #           column "총 첨삭 소요 시간" do |t|
      #             t.total_work_time
      #           end
      #           column "이번 주 첨삭 소요 시간" do |t|
      #             t.week_work_time
      #           end
      #           column "첨삭 갯수" do |t|
      #             t.correct_count
      #           end
      #         end
      #       end
      #     end
      #
      #   end
      #
      #   div class: :row do
      #     panel "전체 사용자 유형별 현황" do
      #       data = User.unscoped.where.not(user_type: nil).group(:user_type).count.transform_keys{|key| I18n.t("custom.#{key}")}
      #       # data = User.user_types.keys.map {|key| t("custom.#{key}")}
      #       bar_chart data, library:{pieSliceText: "value"}
      #     end
      #   end
      # end
