require 'rubygems'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'user_agent')


describe UserAgent::Parser do
  describe 'browser recognition' do

    signatures = [
                  { :name => 'Mozilla Firefox',
                    :useragent => 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.10) Gecko/2009042523 Ubuntu/8.10 (intrepid) Firefox/3.0.10',
                    :browser => :firefox
                  },
                  { :name => 'Google Chrome',
                    :useragent => 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.65 Safari/525.19',
                    :browser => :chrome
                  },
                  { :name => 'Microsoft Internet Explorer 8',
                    :useragent => 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648)',
                    :browser => :ie8
                  },
                  { :name => 'Internet Explorer 7',
                    :useragent => 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; User-agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)',
                    :browser => :ie7
                  },
                  { :name => 'Internet Explorer 6',
                    :useragent => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; GTB6)',
                    :browser => :ie6
                  },
                  { :name => 'Opera',
                    :useragent => 'Opera/9.64 (Windows NT 5.2; U; en-GB) Presto/2.1.1',
                    :browser => :opera
                  },
                  { :name => 'Safari',
                    :useragent => 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.17',
                    :browser => :safari
                  }
                 ]
    signatures.each do |sig|
      it "should recognise #{sig[:name]}" do
        parser = UserAgent::Parser.new(sig[:useragent])
        parser.browser.should == sig[:browser]
      end
    end
  end

  describe "operating system recognition" do
        signatures = [
                  { :name => 'Linux',
                    :useragent => 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.0.10) Gecko/2009042523 Ubuntu/8.10 (intrepid) Firefox/3.0.10',
                    :os => :linux
                  },
                  { :name => 'Microsoft Windows',
                    :useragent => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10 (.NET CLR 3.5.30729)',
                    :os => :windows
                  },
                  { :name => 'MacOS',
                    :useragent => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.10) Gecko/2009042315 Firefox/3.0.1',
                    :os => :mac
                  }
                 ]
    signatures.each do |sig|
      it "should recognise #{sig[:name]}" do
        parser = UserAgent::Parser.new(sig[:useragent])
        parser.operating_system.should == sig[:os]
      end
    end
  end
end


