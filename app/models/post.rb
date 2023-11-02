class Post < ApplicationRecord
  validates_presence_of :title, :description
  validates_uniqueness_of :title
  has_one_attached :cover_image

  def generate_post_pdf
    #create new pdf object
    post_pdf = Prawn::Document.new

    #show header on every pdf page
    post_pdf.repeat(:all) do 
      post_pdf.bounding_box([post_pdf.bounds.left, post_pdf.bounds.top], 
        width: post_pdf.bounds.width) do
          post_pdf.text 'Twitter', size: 30, style: :bold, align: :center
          post_pdf.image 'app/assets/images/twitter.jpg', at: [500, 35], width: 25
          post_pdf.stroke_horizontal_rule #horizontal line
      end

      post_pdf.bounding_box([post_pdf.bounds.left, post_pdf.bounds.bottom + 20], 
        width: post_pdf.bounds.width) do
          post_pdf.stroke_horizontal_rule
          post_pdf.move_down 5 
          post_pdf.text 'Twitter Community', size: 10, style: :bold, align: :center
      end 
      post_pdf.move_down 30
    end

    #adding cursor for multiple pdf pages
    post_pdf.bounding_box([post_pdf.bounds.left, post_pdf.bounds.top - 60], 
      width: post_pdf.bounds.width, height: post_pdf.bounds.height - 100) do
        post_pdf.font('Times-Roman') do #change title size and font
          post_pdf.text title, size: 25, style: :bold, align: :center   #text method displays the data in the pdf
        end
        post_pdf.image StringIO.open(cover_image.download), at: [20, 590], width: 500
        post_pdf.move_down 270
        post_pdf.text description
    end
    post_pdf
  end
end
