module AdminHelper
  def all_topics
    {'' => [''],
     'Cats' => ['catsource.com', 'getthecat.org', 'reddit.com/r/cats'],
     'Dashboards' => ['boringkibana.orga/dashboard-1', 'grafana.sucks'],
     'Presentation' => ['test.de']}
  end
end