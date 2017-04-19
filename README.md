This repo is using pathogen and submodules to manage plugins. Plugins are stored
under `bundle/`.

## Cheatsheet for dealing with submodule plugins

To add a plugin:
```
git submodule add <plugin url> bundle/<plugin-name>
```

To update a single plugin:
```
git submodule update --remote bundle/<plugin-name>
```

To update all plugins:
```
git submodule update --recursive --remote
```

To cancel submodule update and revert to previously committed submodule commit:
```
git submodule update bundle/<plugin-name>
```
or cancel a bulk update by leaving off the `bundle/<plugin-name>`.

**Warning** updating submodules in this manner may pull the latest commits from
the master branch and not necessarily a verified release tag.
