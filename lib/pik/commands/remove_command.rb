module Pik

  class  Remove < Command
  
    aka :rm
    it "Removes a ruby location from pik."
    include ConfigFileEditor
    
    attr_reader :force
    
    def execute
      to_remove = self.class.choose_from(@args, @config)
      raise QuitError unless to_remove
      if force || @hl.agree("Are you sure you'd like to remove '#{to_remove}'? [Yn] ")  
        @config.delete(to_remove)
        @hl.say("#{to_remove} removed")
      end
    end
    
    def command_options
      options.on("--force", "-f", "Remove without prompting") do |value|
        @force = value
      end
    end
    
  end
  
end