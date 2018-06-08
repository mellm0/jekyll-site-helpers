jekyll-site-helpers
===================
### Filters
Filters in jekyll are used on jekyll tags, such as: {{ '/image/test.jpg' | **cachebuster** | **relativity** }}.

- relativity: Make the path of the tag input relative to the page location
- cachebuster: Suffix the file modification time to the tag input, to be used with html5-boilerplate server configs. *Should be used before relativity*.
- filebuster: Same as above, but it will use a defined variable in your _config.yml file instead, so it doesn't have to be used for relativity, and the files don't have to exist yet.

You can learn to use them by opening the ruby plugins and reading the comments.

### Tags
- {{ base }}: Print the current relative path of the page

## Install
Add the following to your `composer.json` file.

```
  "require":{
    "mi3ll/jekyll-site-helpers": "dev-master"
  }
```

In your `extra` section, add the package to the source/_plugins directory of your jekyll site.

```
  "extra": {
    "installer-paths": [
       "./src/_plugins/{$name}": ["mi3ll/jekyll-site-helpers"]
    ]
  }
```

### License
* MIT

### Version
* 2016

### Contact
#### Mellisa Hankins
* E-mail: mellisa.hankins@me.com
* Twitter: [@mi3ll](https://twitter.com/mi3ll "mi3ll on twitter")
