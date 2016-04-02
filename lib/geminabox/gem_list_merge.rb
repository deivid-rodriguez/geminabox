module Geminabox
  class GemListMerge
    attr_accessor :list

    def self.from(*lists)
      lists.map{|list| new(list)}.inject(:merge)
    end

    def initialize(list)
      @list = list
    end

    def merge(other)
      merged = (list + other.list)
      merged.uniq! {|val| val.values[name_version] }
      merged.sort! {|x, y| x.values[name_version] <=> y.values[name_version] }
      merged
    end

    def name_version
      0..1
    end

  end
end
