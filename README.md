## TL;DR
``` ruby
class YourController < ApplicationController
  before_filter YourFilterClass.new
end

# Inside app/filters/your_filter_class.rb
class YourFilterClass
  include FilterObject::Filter

  def filter(controller)
    super
     # your filter logic starts here...
  end
end
```

## What's a Filter Object?

A filter object is a nice way to remove logic from your controller. Usually you start implementing simple filter methods, like these

``` ruby
class YourController < ApplicationController
  before_filter :your_filter_method

  # your actions...

  private
  def your_filter_method
    # some simple logic here...
  end
end
```

and everything is fine. As the time passes you start to add more code to the `your_filter_method` filter method. It will look like shit after some time... 

Sometimes the problem already starts too complicated for a single method. 

Rails already provides a way to fix this kind of problem. You can do something like this:

``` ruby
class YourController < ApplicationController
  before_filter FilterClass

  # your actions...
end

class FilterClass
  def self.filter(controller)
    # your complex filter logic goes here...
  end
end
```

and it will work. Only that now you are creating a lot of class methods, which are hard to test. Also, it's hard to keep state inside your filter. The nice thing is that you can easily pass anything that responds to `filter` to the before_filter and after_filter calls. So why not pass an instance?

``` ruby
class YourController < ApplicationController
  before_filter FilterClass.new

  # your actions...
end

class FilterClass
  def filter(controller)
    # your complex filter logic goes here...
  end
end
```

Ok, now this is real OO! It will much easier to write your tests, too. But you'll need to handle methods delegation to the controller, things like calling `params`, `render`, and so on. 

This is where filter_object comes in.

``` ruby
class FilterClass
  include FilterObject::Filter

  def filter(controller)
    super # so filter_object can set the delegations
    
    if params[:programming_is] != "cool" # the call to params will be automatically redirected to the controller
      redirect_to program_more_path
    end
  end
end
```

Now you can call controller methods directly inside your filter objects and they will be properly delegated to the controller. 

#### Methods that will be automatically delegated to the controller
* params
* flash
* render
* redirect_to
* cookies
* session
* headers
* request

If you are using a controller method that is not listed here, please send a pull request!

## Why a gem for such a simple and stupid code?

Because I was repeating this thing all over my projects, so I got tired.

