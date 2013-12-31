desc "Convert Topics in database to YAML files"
task :db_to_md => :environment do
  `rm -rf data`
  `mkdir -p data`

  Topic.find_each do |topic|
    File.open("data/#{topic.slug}.md", 'w') do |file|
      front_matter = {
        'title' => topic.title.strip,
        'alernate_titles' => topic.alternate_titles.map(&:title),
        'parents' => topic.parents.map(&:slug),
        'resources' => topic.resources.map{|r| {'title' => r.title, 'url' => r.url} }
      }

      file << <<-END
#{front_matter.to_yaml.strip}
---

#{topic.description.strip}
END
    end
  end
end
