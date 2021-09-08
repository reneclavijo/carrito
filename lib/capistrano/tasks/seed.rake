desc "reload the database with seed data"
task :seed do
    exec("cd #{current_path}; rails db:seed -e production")
end