namespace :employees do
  desc "TODO"
  task assign_secure_ids: :environment do

  	Employee.all.each do |e|
  		e.assign_secure_id
  	end

  end

end
