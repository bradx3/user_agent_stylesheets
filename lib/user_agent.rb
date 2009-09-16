

module UserAgent
  class Parser
    def initialize(useragent)
      @useragent = useragent
    end

    def browser
      case @useragent
      when /.*Firefox.*/ then
        :firefox
      when /.*AppleWebKit.*Chrome.*/ then
        :chrome
      when /.*MSIE 8.*/ then
        :ie8
      when /.*MSIE 7.*/ then
        :ie7
      when /.*MSIE 6.*/ then
        :ie6
      when /.*Opera.*/ then
        :opera
      when /.*AppleWebKit.*Safari.*/ then
        :safari
      end
    end

    def operating_system
      case @useragent
      when /.*Windows.*/ then
        :windows
      when /.*Linux.*/ then
        :linux
      when /.*Macintosh.*/ then
        :mac
      end
    end
  end
end
