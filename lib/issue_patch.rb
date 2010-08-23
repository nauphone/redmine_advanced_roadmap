require_dependency "issue"

module IssuePatch
  def self.included(base)
    base.class_eval do
      def rest_hours
        if !@rest_hours
          @rest_hours = 0.0
          if !(closed?)
            if (spent_hours > 0.0) && (done_ratio > 0.0)
              if done_ratio < 100.0
                @rest_hours = ((100.0 - done_ratio.to_f) * spent_hours.to_f) / done_ratio.to_f
              end
            else
              @rest_hours = ((100.0 - done_ratio.to_f) * estimated_hours.to_f) / 100.0
            end
          end
        end
        @rest_hours
      end
    end
  end
end
