namespace :rotate do
  # benchmark: 100k updates in 00:28:35 with cost '800$8$1$'
  # e.g.
  #  bundle exec rake rotate:email_encryption_key ATTRIBUTE_COST='800$8$1$'
  #
  desc 'attribute encryption key'
  task attribute_encryption_key: :environment do
    num_users = User.count
    progress = new_progress_bar('Users', num_users)

    User.find_in_batches.with_index do |users, _batch|
      User.transaction do
        users.each do |user|
          rotator = KeyRotator::AttributeEncryption.new(user)
          rotator.rotate
          progress&.increment
        end
      end
    end
  end

  def new_progress_bar(label, num)
    return if ENV['PROGRESS'] == 'no'
    ProgressBar.create(
      title: label,
      total: num,
      format: '%t: |%B| %j%% [%a / %e]'
    )
  end
end
