class Department < ActiveRecord::Base
  after_commit "self.class.flush_cache"

  class << self
    extend Memoist

    def code_name_map(user_id)
      departments = self.where(user_id: user_id)
      map = {}
      departments.each do |department|
        map[department.code] ||= []
        map[department.code] << department
      end
      map
    end

    def by_code(user_id, code)
      self.code_name_map(user_id)[code]
    end

    memoize :code_name_map
  end
end
