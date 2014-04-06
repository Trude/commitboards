class ScriptsController < ApplicationController
  layout false

  def capture_script
    render 'capture.rb.erb'
  end

  def background_capture_script
    render 'background_capture.rb.erb'
  end

  def update_and_capture_script
    render 'update_and_capture.rb.erb'
  end

  def imagesnap
    send_file 'vendor/imagesnap/imagesnap'
  end

  def version
    render text: files_hash
  end

private
  def files_hash
    scripts = [
      "#{Rails.root}/app/views/scripts/capture.rb.erb",
      "#{Rails.root}/app/views/scripts/background_capture.rb.erb",
      "#{Rails.root}/app/views/scripts/update_and_capture.rb.erb",
      "#{Rails.root}/vendor/imagesnap/imagesnap"]

    md5_for_all = scripts.map { |s| Digest::MD5.file(s).hexdigest }.join('')

    Digest::MD5.hexdigest(md5_for_all)
  end
end
