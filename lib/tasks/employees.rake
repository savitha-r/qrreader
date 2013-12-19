namespace :employees do
  desc "TODO"
  task assign_hashed_ids: :environment do

  	Employee.all.each do |e|
  		e.assign_hashed_id
  	end

  end

end
