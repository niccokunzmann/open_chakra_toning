# Open Chakra Toning

[![release](https://github.com/niccokunzmann/open_chakra_toning/actions/workflows/release.yml/badge.svg)](https://github.com/niccokunzmann/open_chakra_toning/actions/workflows/release.yml)

Open your chakras by singing to their frequencies.

[![Get it on Flathub](https://flathub.org/api/badge?locale=en)](https://flathub.org/apps/eu.quelltext.open_chakra_toning)

You might want to

- **[Try it out!][web]**
- [Donate using GitHub Sponsors][gh-sponsors]
- [Translate the App][translate] (or request your language)

## Setup

This is a flutter project. You can follow their [setup guide](https://docs.flutter.dev/get-started/install)
and build the project.

## Translations

This app can be translated into your language.

What to translate:

- `assets/i18n/LANG.json`
- `metadata/LANG/title.txt`
- `metadata/LANG/short_description.txt`
- `metadata/LANG/long_description.txt`

## Branches

The [`main` branch](https://github.com/niccokunzmann/open_chakra_toning/tree/main) contains the source code to build the app.  
The [`gh-pages` branch](https://github.com/niccokunzmann/open_chakra_toning/tree/gh-pages) is a [web deployment of the app][web].  
The [`sound` branch](https://github.com/niccokunzmann/open_chakra_toning/tree/sound) contains raw sound data.  

## Release

In order to create a new release, please follow this procedure:

1. Change the `pubspec.yml`, increment the last version **Z**.

   ```yaml
   # ...
   version: 1.0.Z+Z
   # ...
   msix_config:
     # ...
     msix_version: 1.0.Z.0
   ```

2. Record the changes from `git log` since the last release in the `metadata/en/changelogs/Z.txt` file.
3. Commit and push the commit.

   ```sh
   git checkout main
   git pull
   git add metadata/en/changelogs pubspec.yml
   git commit -m"version 1.0.Z"
   git push
   ```

4. Wait until the initial tests have run on [GitHub Actions][actions].
5. Create a tag and push it:

   ```sh
   git checkout main
   git pull
   git tag v1.0.Z
   git push origin v1.0.Z
   ```

This should release a new version.

[web]: https://niccokunzmann.github.io/open_chakra_toning/
[gh-sponsors]: https://github.com/sponsors/niccokunzmann
[actions]: https://github.com/niccokunzmann/open_chakra_toning/actions
[translate]: https://app.transifex.com/mundraub-android/open-chakra-toning/dashboard/
