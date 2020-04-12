class Solution < ApplicationRecord
    
    RESULT = {
        "상대적으로 낮은 위험성" => {
            short: "상대적으로 낮은 위험성 - 홈케어 시도 후 수 일 내 호전되지 않으면 내원 권고", 
            detail: "홈케어를 시도하며 2~3일간 관리해 주세요. 증상이 지속되면 의료진의 도움이 필요할 수 있습니다."
        },
        "질병 징후 가능성 있음" => {
            short: "질병 징후 가능성 있음 - 24시간 관찰 후 호전되지 않으면 내원권고", 
            detail: "하루 정도 홈케어를 시도해 주세요. 24시간 이내 증상이 재발하거나 호전되지 않으면 의료진의 도움이 필요할 수 있습니다."
        },
        "의료진 상담 필요" => {
            short: "의료진 상담필요 - 24시간 이내 내원 권고", 
            detail: "응급상황은 아니지만, 해당 증상은 질병의 징후일 수 있습니다. 24시간 이내로 의료진의 상담을 받아보시길 권장합니다."
        },
        "준응급상황" => {
            short: "준응급상황 - 12시간 이내 내원 권고", 
            detail: "12시간 이내로 수의사의 도움을 받아야 하는 준응급상황입니다."
        },
        "명백한 응급상황" => {
            short: "명백한 응급상황 - 즉시내원", 
            detail: "즉시 수의사의 도움을 받아야 하는 응급상황입니다."
        }
    }

    enum result: RESULT.keys

    def result_short
        RESULT[self.result].dig(:short)
    end

    def result_detail
        RESULT[self.result].dig(:detail)
    end
end
