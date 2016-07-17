object @client
attributes :id, :name, :company, :email, :mobile
node(:edit_url) {|client| edit_client_url(client)}

child :projects do
	attributes :id, :name, :description, :start_date, :status
	node(:show_url) {|project| project_url(project, format: "json")}
end

