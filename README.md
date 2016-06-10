2.x-static-plugins
==================
These are plugins for the 2.x-static website builder.

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
    "mnsami/composer-custom-directory-installer": "~1",
    "milkyway-multimedia/2.x-static-plugins": "*"
  }
```

In your `extra` section, add the package to the source/_plugins directory of your jekyll site.

```
  "extra":{
    "installer-paths": [
       "./src/_plugins/{$name}": ["milkyway-multimedia/2.x-static-plugins"]
    ]
  }
```

### License
* Commercial

### Version
* 2016

### Contact
#### Milkyway Multimedia
* Homepage: http://milkywaymultimedia.com.au
* E-mail: mell@milkywaymultimedia.com.au
* Twitter: [@mwmdesign](https://twitter.com/mwmdesign "mwmdesign on twitter")