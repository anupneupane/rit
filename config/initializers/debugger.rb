if (Rails.env.development? || Rails.env.test?) && !$rails_rake_task
    require 'debugger'
    Debugger.settings[:autoeval] = true
    Debugger.settings[:autolist] = 1
    Debugger.settings[:reload_source_on_change] = true
end
