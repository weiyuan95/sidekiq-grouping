# frozen_string_literal: true

class RegularWorker
  include Sidekiq::Worker

  def perform(foo); end
end

class BatchedSizeWorker
  include Sidekiq::Worker

  sidekiq_options queue: :batched_size, batch_flush_size: 3, batch_size: 2

  def perform(foo); end
end

class RetryBatchedWorker
  include Sidekiq::Worker

  sidekiq_options(
    retry: 5, queue: :retry_batched, batch_flush_size: 3, batch_size: 3
  )

  def perform(foo); end
end

class BatchedIntervalWorker
  include Sidekiq::Worker

  sidekiq_options queue: :batched_interval, batch_flush_interval: 3600

  def perform(foo); end
end

class BatchedBothWorker
  include Sidekiq::Worker

  sidekiq_options(
    queue: :batched_both, batch_flush_interval: 3600, batch_flush_size: 3
  )

  def perform(foo); end
end

class BatchedUniqueArgsWorker
  include Sidekiq::Worker

  sidekiq_options(
    queue: :batched_unique_args, batch_flush_size: 3, batch_unique: true
  )

  def perform(foo); end
end
