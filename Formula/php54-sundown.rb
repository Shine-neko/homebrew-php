require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Sundown < AbstractPhp54Extension
  init
  homepage 'https://github.com/chobie/php-sundown'
  url 'https://github.com/chobie/php-sundown/archive/v0.3.8.zip'
  sha1 'e510195ec7898d2d89b30bcbdf142f6e73dc3db1'
  head 'https://github.com/chobie/php-sundown'

  def install
    ENV.universal_binary if build.universal?

    Dir.chdir 'ext/sundown' do
      safe_phpize
      system "./configure", "--prefix=#{prefix}",
                            phpconfig
      system "make"
      prefix.install %w(modules/sundown.so)
    end
    write_config_file unless build.include? "without-config-file"
  end
end
