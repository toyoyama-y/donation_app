class DonationsController < ApplicationController
  def index
  end

  def new
    @donation = UserDonation.new   #「UserDonation」に編集
  end

  def create
    @donation = UserDonation.new(donation_params)   #「UserDonation」に編集
    if @donation.valid?
      @donation.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render "new"    # バリデーションに弾かれた時
    end
  end

  private

  def donation_params
    #「住所」「寄付金」のキーも追加
    params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price)
  end

end
