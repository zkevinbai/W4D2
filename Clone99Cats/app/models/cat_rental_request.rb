# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  STATUSES = %w(PENDING APPROVED DENIED)

  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUSES }
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def does_not_overlap_approved_request
    unless overlapping_approved_request.empty?
      raise errors[:cat_id] << "is already rented out"
    end
  end

  def overlapping_approved_request
    overlapping_requests("APPROVED")
  end
  
  def overlapping_requests(status)
    # cats =SELECT *
    # FROM cat_rental_requests
    # WHERE cat_rental_requests.cat_id = cat_id 
    # AND cat_rental_requests.status = "APPROVED"
    CatRentalRequest.where(cat_id: cat_id).where(status: status)
  end
end


