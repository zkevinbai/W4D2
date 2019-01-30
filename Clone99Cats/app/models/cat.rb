# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS =  ["Tortoiseshell","Calico","Orange Taby",
             "Brown Tabby", "Gray Tabby", "Black",
             "Gray", "White", "Tuxedo", "Black and White"]

  validates :birth_date, :color, :name, :sex, :description, presence: true

  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w(M F) }

  def age
    year = Date.today.year - birth_date.year
    month = Date.today.month - birth_date.month
    if month.abs > 6
      "#{name} is almost #{year+1}"
    elsif year < 1
      "#{name} is #{month} months old"
    else
      "#{name} is #{year} years old"
    end
  end
end
