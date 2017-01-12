RSpec::Matchers.define :format_url_with do |item, category_code|
  match do 
    expect(Craiggy::PostUrl).to have_received(:new).
      with(item, category_code)
  end

  failure_message do
    "Url is not formatted with proper category code: '#{category_code}'"
  end
end

def expect_to_format_url(namespace, item, category_code)
  describe namespace do
    subject { Craiggy.class_eval(namespace).get(item) }
    it { should format_url_with(item, category_code) }
  end
end
