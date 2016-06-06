class ComSession
  include ActiveModel::Model

  attr_accessor :handle

  validates_presence_of :handle
  validate :must_be_a_communicator

  def communicator?
    !! Communicator.where(handle: handle).first
  end

  private

  def must_be_a_communicator
    unless communicator?
      errors.add(:handle, :must_be_a_communicator, handle: handle)
    end
  end

end
