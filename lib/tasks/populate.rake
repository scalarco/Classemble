namespace :db do
  desc "Fill database with initial data"
    task :populate => :environment do

    #################################################
    ## BIOINFORMATICS
    #################################################

    # Skill.delete_all
    # Interest.delete_all
    # UserToSkill.delete_all
    # UserToInterest.delete_all

    users = [
      ["Hugh", "Deloney", "hudel@gmail.com", [["BioPerl",6],["BioRuby",5]], ["diseases"]],
      ["Clayton", "Imboden", "imboclay@yahoo.com", [["Unix",8],["SciPy",7],["BioJava",7]], ["analysis"]],
      ["Jessie", "Kerl", "kerlj@aol.com", [["BioPython",6],["NumPy",7]],["computation", "analysis"]],
      ["Nelson", "Singler", "nelssing@gmail.com", [["Unix",10]], ["analysis"]],
      ["Earlene", "Reddington", "earred@hotmail.com", [["BioJava",6],["nursing",7]], ["helping patients"]],
      ["Matthew", "Henrich", "henrma@gmail.com", [["RPy",6],["Apache",5]],["databases", "analysis"]],
      ["Clayton", "Gowin", "gowcl@gmail.com", [["BioRuby",8],["SciPy",6]],["web-development"]],
      ["Allie", "Drewery", "alldrew@yahoo.com", [["BioJava",6],["Unix",5]],["data management"]],
      ["Erik", "Harger", "hargerik@gmail.com", [["BioPython",5],["RPy",6],["BioJava",7]],["analysis"]],
      ["Ted", "Antos", "anted@gmail.com", [["Unix",7],["BioPython",7],["SciPy",7]],["computation"]],
      ["Nelson", "Klem", "nelklem@yahoo.com", [["BioRuby",4],["Unix",8]],["learning"]],
      ["Eve", "Bearce", "evebear@aol.com", [["NumPy",8]], ["analysis"]]
    ]

    users.each do |user|
      u = User.create(name: user[0] + " " + user[1], email: user[2], password: user[2])
      user_id = u.id
      skills = user[3]
      skills.each do |skill|
        skill_id = Skill.find_by_name(skill[0]).id
        level = skill[1]
        UserToSkill.create(level: level, user_id: user_id, skill_id: skill_id.to_i)
      end  
      interests = user[4]
      interests.each do |interest|
        interest_id = Interest.find_by_name(interest).id
        UserToInterest.create(user_id: user_id, interest_id: interest_id)
      end  
    end

    projects = [
      ["TheCancerStudy", ["Unix", "BioJava", "SciPy"], "analysis", "Study similarities of cancer patients.", "Looking for someone to analyze dna data from cancer patients to find cause factors.", "evebear@aol.com"],
      ["SuperhumanProject", ["BioPython", "NumPy", "Unix", "Apache"], "computation", "Research into modifying DNA.", "Help compute what outcomes changing DNA strands wo;; have on humans..create a super-human?", "nelssing@gmail.com"],
      ["STDTracker", ["RPy", "BioRuby", "BioPerl"], "analysis", "Track STDs by location.", "Help map a grid to show the location statistics for STD infection. Keep people safe from unwanted disease.", "imboclay@yahoo.com"],
      ["SmokeStudy", ["BioJava", "Unix"], "study", "Study effects of smoking on different users.", "Looking for someone who can use samples from smokers' lungs to create meaningful data regarding the side effects of smoking.", "alldrew@yahoo.com"]
    ]

    projects.each do |project|
      user_id = User.find_by_email(project[5]).id
      p = Project.create(title: project[0], user_id: user_id, short_description: project[3], description: project[4], category: project[2])
      project_id = p.id      
      #interest_id = Interest.find_by_name(project[2]).id
      skills = project[1]
      skills.each do |skill|
        skill_id = Skill.find_by_name(skill).id
        ProjectToSkill.create(project_id: project_id, skill_id: skill_id)
      end  
    end

    ##########################################
    ## COMPUTER SCIENCE
    ##########################################

    users = [
      ["Erik", "Shoff", "shoff@yahoo.com", [["HTML",8], ["CSS",6], ["PHP",7]], ["web-development"]],
      ["Hugh", "Nagao", "nag@aol.com", [["Java",7], ["C#",9], ["C++",8], ["HTML",5]], ["game-development", "back-end"]],
      ["Cody", "Eastham", "hamofeast@gmail.com", [["Javascript",7], ["Ruby on Rails",8], ["SQL",7]], ["music", "green-projects", "web-development"]],
      ["Fernando", "Kleinshmidt", "klein@hotmail.com", [["Algorithms",8], ["C",8], ["Assembly",7]], ["systems", "machine learning"]],
      ["Javier", "Knobel", "knowbell@yahoo.com", [["Python", 6], ["HTML", 7]], ["web-development", "sports"]],
      ["Christian", "Burchell", "birchtree@gmail.com", [["Java",9], ["XCode",10], ["XML",9]], ["mobile-development", "travel"]],
      ["Mathew", "Keirn", "nriek@bu.edu", [["Javascript",7], ["JQuery",7], ["PHP",6], ["HTML",8]], ["front-end", "web-development"]],
      ["Jamie", "Spoor", "jspoor@gmai.com", [["Java",8], ["Haskell",6], ["SQL",6]], ["databases", "back-end"]],
      ["Erik", "Novello", "erinov@yahoo.com", [["CSS",10]], ["web-design"]],
      ["Erica", "Moor", "moorerica@aol.com", [["PHP",5], ["HTML",4], ["Javascript",6]], ["web-development"]],
      ["Stanley", "Kotts", "kottss@gmail.com", [["Java",8]], ["back-end"]],
      ["Jared", "Parker", "jarpar@yahoo.com", [["SQL",8], ["PHP",7], ["C#",7]], ["databases","web-development"]]
    ]

    users.each do |user|
      u = User.create(name: user[0] + " " + user[1], email: user[2], password: user[2])
      user_id = u.id
      skills = user[3]
      skills.each do |skill|
        skill_id = Skill.find_by_name(skill[0]).id
        level = skill[1]
        UserToSkill.create(level: level, user_id: user_id, skill_id: skill_id.to_i)
      end  
      interests = user[4]
      interests.each do |interest|
        interest_id = Interest.find_by_name(interest).id
        UserToInterest.create(user_id: user_id, interest_id: interest_id)
      end  
    end

    # Project.create([
    #   {title: "PimpMyPhone", short_description: "An app to pimp your phone.", 
    #     description: "Looking for experienced mobile developer to help create for andoird and iOS. Pimp my phone will allow for full customization of the phone's user interface.", 
    #     user_id: 1, category: "mobile-development"}, 
    #   {title: "REALestate", short_description: "A site to find a place to live.", 
    #     description: "REALestate connects potential tenants directly to landlords renting apartments. Help build a service to benefit every person who ever felt ripped off by realtor fees.", 
    #     user_id: 1, category: "web-development"}, 
    #   {title: "YouRobot", short_description: "Build a robot as smart as you.", 
    #     description: "Be a part of a team working on the cutting edge of science looking for intelligent programmers to help create algorithms for our robot to learn from human actions.", 
    #     user_id: 2, category: "machine-learning"}, 
    #   {title: "PLATFORMX", short_description: "Work on an awesome game.", 
    #     description: "PLATFORMX lets you play as the coolest guy of all videogames, Duke Nukem. It's basically Duke Nukem combined with Super Mario Brothers. If you like games, this project is the one for you.", 
    #     user_id: 2, category: "game-development"},             
    # ])

    projects = [
      ["PimpMyPhone", ["Java", "XCode", "XML", "Android", "IOS"], "mobile-development", "An app to pimp your phone.", "Looking for experienced mobile developer to help create for android and iOS. Pimp my phone will allow for full customization of the phone's user interface.", "knowbell@yahoo.com"],
      ["REALestates", ["SQL", "Javascript", "HTML", "PHP"], "computation", "A site to find a place to live.", "REALestate connects potential tenants directly to landlords renting apartments. Help build a service to benefit every person who ever felt ripped off by realtor fees.", "erinov@yahoo.com"],
      ["YouRobot", ["Algorithms", "C", "Artificial Intelligence"], "machine-learning", "Build a robot as smart as you.", "Be a part of a team working on the cutting edge of science looking for intelligent programmers to help create algorithms for our robot to learn from human actions.", "shoff@yahoo.com"],
      ["PLATFORMX", ["C#", "Graphics"], "game-development", "Work on an awesome game.", "PLATFORMX lets you play as the coolest guy of all videogames, Duke Nukem. It's basically Duke Nukem combined with Super Mario Brothers. If you like games, this project is the one for you.", "moorerica@aol.com"]
    ]

    projects.each do |project|
      user_id = User.find_by_email(project[5]).id
      p = Project.create(title: project[0], user_id: user_id, short_description: project[3], description: project[4], category: project[2])
      project_id = p.id      
      #interest_id = Interest.find_by_name(project[2]).id
      skills = project[1]
      skills.each do |skill|
        skill_id = Skill.find_by_name(skill).id
        ProjectToSkill.create(project_id: project_id, skill_id: skill_id)
      end  
    end

  end
end
