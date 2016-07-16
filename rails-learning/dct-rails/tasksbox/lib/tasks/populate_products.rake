desc "populate the product database"
task :populate_products => :environment do

15.times do
    pc = ProductCategory.new
    pc.name = Faker::Commerce.department
    pc.save
end

5000.times do
    p = Product.new
    p.name = Faker::Commerce.product_name
    p.price = Faker::Commerce.price
    p.product_category_id = ProductCategory.all.pluck(:id).sample
    p.save
end

end
