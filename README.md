# reveal-md

This cookbook installs what you need to run to get [reveal-md][reveal_md] running.

## Scope

This cookbook focuses building a machine for [reveal-md][reveal_md]. You can put
a markdown document in place of [index.md](files/default/index.md) and run
`bundle exec kitchen verify`. You'll recieve a URL at the end that you can click
and have everything you need to display your presentation.

If you would like, there is nothing wrong with [forking][reveal_md_fork] this repo
then putting your own `.md` in the location for [index.md](files/default/index.md).

## Requirements

- Chef 12.0.0 or higher
- Ubuntu 14.04 or higher

## Usage

Either set the [default.rb](recipes/default.rb) as in your `run_list`. Or run
`bundle exec kitchen verify` to spin up an instance of kitchen to use.

### default.rb

Standard provisioning for everything you need to run reveal-md.

- Assumes your on Ubuntu
- Installs newest version of NodeJS
- Copies the file into the correct loctation
- Starts the nodejs instance

## License and Authors

Author:: JJ Asghar (<jj@chef.io>)

Copyright:: Copyright (c) 2016 Chef Software, Inc.

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the License at

```
http://www.apache.org/licenses/LICENSE-2.0
```

Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.

## Contributing

1. Fork it ( https://github.com/jjasghar/reveal-md-cookbook/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[reveal_md]: https://github.com/webpro/reveal-md
[reveal_md_fork]: https://github.com/jjasghar/reveal-md-cookbook#fork-destination-box
