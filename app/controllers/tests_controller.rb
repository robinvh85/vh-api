require 'csv'

class TestsController < ApplicationController
  def index
    file = Tempfile.new('test', Rails.root.join('tmp'), encoding: Encoding::SJIS)
    csv = CSV.generate(encoding: Encoding::SJIS) do |csv_file|
      # header
      csv_file << ['アーティスト名', '曲名']
      # body
      csv_file << ['fall out boy','Dance, Dance']
      csv_file << ['fall out boy','saturday']
    end
    file.write(csv)

    # data = "ID 商品名 価格 作成日時 更新日時".encode(Encoding::SJIS)
    # render plain: file.path
    send_file file, type: 'text/csv; charset=shift_jis', filename: "items.csv"
  ensure
    file.close
    # file.unlink
  end

  def download
    data = "ID 商品名 価格 作成日時 更新日時".encode(Encoding::SJIS)
    send_data data, type: 'text/csv; charset=shift_jis', filename: "items.csv"
  end

  def create_file
  end

  def get_file
    file = Tempfile.open(params['filename'], Rails.root.join('tmp'))
    send_data file, type: 'text/csv; charset=shift_jis', filename: "items.csv"
  ensure
    file.close
    # file.unlink
  end
end
