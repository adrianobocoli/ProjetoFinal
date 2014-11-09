if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJGLJ2KUQMW6G5YUQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['projetofinaltopicos']
  end
end
