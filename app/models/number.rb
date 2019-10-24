class Number < ApplicationRecord

  validates :ph_num, presence: true, length: { is: 10 }

  def self.generate_phone_number user_number
    if user_number.present? && !self.exists?(ph_num: user_number)
      create(ph_num: user_number)
    else
      generate_random_phone_number
    end
  end

  def self.generate_random_phone_number
    flag = true
    phone_num = nil
    while flag do
      a = [1,2,3,4,5,6].shuffle.first
      if a.even?
        number = Time.now.to_i.to_s
        front_part = number[0..2].to_i
        middle_part = number[3..5].to_i
        end_part = number[6..9].to_i
        if end_part < 1111 || middle_part < 111 || front_part < 111 || number.length != 10
          number = generate_random_number
        end
      else
        number = generate_random_number
      end

      unless self.exists?(ph_num: number)
        flag = false
        phone_number = create(ph_num: number)        
      end
    end
    phone_number
  end

  private
   
  def self.generate_random_number
    (111 + rand(889)).to_s + (111 + rand(889)).to_s + (1111 + rand(8889)).to_s
  end

end
