module RDocTool
  class Paragraph
    attr_reader :items

    def initialize(*items)
      @items = items
      @has_margin = false
      @with_empty_line_at_end = false
    end

    def has_margin?
      @has_margin
    end

    def margin!(has = true)
      @has_margin = has
      self
    end

    def with_empty_line_at_end?
      @with_empty_line_at_end
    end

    def empty_line_at_end!(with = true)
      @with_empty_line_at_end = with
      self
    end

    def empty?
      @items.empty?
    end

    def size
      @items.size
    end

    def <<(item)
      if item
        @items << item
      end
      self
    end

    def to_s
      to_str
    end

    def to_str
      string = ""

      items.each do |item|
        case item
        when Paragraph
          string << item.to_s
        when String
          string << item
        else
          raise
        end

        string.rstrip!

        next if string.empty?

        string << "\n"
        if has_margin?
          string << "\n"
        end
      end

      # Ensure there is one line break at end of the string
      string.rstrip!

      unless string.empty?
        string << "\n"
        # Add empty line at end of the string
        if with_empty_line_at_end?
          string << "\n"
        end
      end

      string
    end
  end
end
