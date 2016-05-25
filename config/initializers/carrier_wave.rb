#if Rails.env.production?
#  CarrierWave.configure do |config|
#    config.fog_credentials = {
#      # Amazon S3 的配置
#      :provider              => 'AWS',
#      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
#      :aws_secret_access_key =>['S3_SECRET_KEY']
#    }
#    config.fog_directory     = ENV['S3_BUCKET']
#  end
#end
# 上面的代码中使用了 Heeoku 中的 ENV 变量，在 heroku 中执行一下命令进行配置定义
# $ heroku config:set S3_ACCESS_KEY=<access key>
# $ heroku config:set S3_SECRET_KEY=<secret key>
# $ heroku config:set S3_BUCKET=<bucket name>
