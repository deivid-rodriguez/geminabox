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
      merged.uniq! {|val| val.values[ignore_dependencies] }
      merged.sort! {|x, y| x.values[ignore_dependencies] <=> y.values[ignore_dependencies] }
      merged
    end

    def ignore_dependencies
      0..-2
    end

  end
end
