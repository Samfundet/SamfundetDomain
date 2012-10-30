# encoding: UTF-8

desc "Load the seed data from SamfundetDomain's db/seeds.rb"
namespace :samfundet_domain_engine do
  namespace :db do
    task :seed => :environment do
      print "Deleting existing group types, groups and areas, and proceeding with creating new ones.. "

      tasks = []

      [GroupType, Group, Area].each do |model|
        tasks << Proc.new do
          model.delete_all
        end
      end

      group_types = [
        'Styrende organ',
        'Arrangerende',
        'Drift',
        'Kunstneriske',
        'Media',
        'Festivaler',
        'Administrative',
        'Andre grupperinger'
      ]

      group_types.each_with_index do |group_type, priority|
        tasks << Proc.new do
          GroupType.create!(
            :description => group_type,
            :priority => priority
          )
        end
      end

      groups = [
         { :name => "Arkivet", :abbreviation => "", :group_type => GroupType.find_by_description('Administrative') },
         { :name => "Regi", :abbreviation => "", :group_type => GroupType.find_by_description('Drift') },
         { :name => "ISFiT 2011", :abbreviation => "", :group_type => GroupType.find_by_description('Festivaler') },
         { :name => "Samfundets byggekomite", :abbreviation => "SBK", :group_type => GroupType.find_by_description('Administrative') },
         { :name => "Finansstyret", :abbreviation => "FS", :group_type => GroupType.find_by_description('Styrende organ') },
         { :name => "Propheten", :abbreviation => "", :group_type => GroupType.find_by_description('Media') },
         { :name => "Kulturutvalget", :abbreviation => "KU", :group_type => GroupType.find_by_description('Arrangerende') },
         { :name => "IT-komiteen", :abbreviation => "ITK", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Kontrollkontoret", :abbreviation => "KK", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Radio Revolt", :abbreviation => "Radion", :group_type => GroupType.find_by_description('Media') },
         { :name => "Big Mama's Cowboys", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "S. Møller Storband", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Lørdagskomitéen", :abbreviation => "LK", :group_type => GroupType.find_by_description('Arrangerende') },
         { :name => "Profilgruppa", :abbreviation => "Profil", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Markedsføringsgjengen", :abbreviation => "MG", :group_type => GroupType.find_by_description('Drift')},
         { :name => "Musikerlåfte", :abbreviation => "Låfte", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Diversegjengen", :abbreviation => "DG", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Videokomitéen", :abbreviation => "VK", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Trondhjems Kvinnelige Studentersangforening", :abbreviation => "TKS", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Rådet", :abbreviation => "", :group_type => GroupType.find_by_description('Styrende organ') },
         { :name => "Strindens Prom Orchester", :abbreviation => "SPO", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Kjellerbandet", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Leisure Suit Lovers", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Pirum", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Snaustrinda", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Symfoniorkesteret", :abbreviation => "Symforch", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Salongorkestret", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Knauskoret", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Trondheim InterRail Centre", :abbreviation => "TIRC", :group_type => GroupType.find_by_description('Andre grupperinger') },
         { :name => "Gjengsekretariatet", :abbreviation => "GS", :group_type => GroupType.find_by_description('Administrative') },
         { :name => "Akademisk Radioklubb", :abbreviation => "ARK", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Under Dusken", :abbreviation => "UD", :group_type => GroupType.find_by_description('Media') },
         { :name => "UKA-11", :abbreviation => "", :group_type => GroupType.find_by_description('Festivaler') },
         { :name => "Sitting ducks", :abbreviation => "SD", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Trondhjems Studentersangforening", :abbreviation => "TSS", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Student-TV", :abbreviation => "STV", :group_type => GroupType.find_by_description('Media') },
         { :name => "Kafé- og Serveringsgjengen", :abbreviation => "KSG", :group_type => GroupType.find_by_description('Arrangerende') },
         { :name => "Klubbstyret", :abbreviation => "KLST", :group_type => GroupType.find_by_description('Arrangerende') },
         { :name => "Studentersamfundets Interne Teater", :abbreviation => "SIT", :group_type => GroupType.find_by_description('Kunstneriske') },
         { :name => "Styret", :abbreviation => "", :group_type => GroupType.find_by_description('Styrende organ') },
         { :name => "Gjengsjefkollegiet", :abbreviation => "GSK", :group_type => GroupType.find_by_description('Administrative') },
         { :name => "Forsterkerkomiteen", :abbreviation => "FK", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Fotogjengen", :abbreviation => "FG", :group_type => GroupType.find_by_description('Drift') },
         { :name => "Candiss", :abbreviation => "", :group_type => GroupType.find_by_description('Kunstneriske') },
      ]

      groups.each do |group|
        tasks << Proc.new do
          Group.create! group
        end
      end

      print "00%"

      tasks.each_with_index do |task, index|
        task.call
        print "\b\b\b%02d\%" % (100 * (index.to_f + 1) / tasks.length.to_f)
      end

      print "\n"
    end
  end
end
