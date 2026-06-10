# Spacer Blocks

This is a simple scad project that generates spacer blocks for common woodworking measurements.
There are options for both metric and imperial.

## Using the generator

This project uses the buildscad cli tool to [buildscad](https://github.com/dduxx/buildscad)
manage its build and dependencies. You will have to install that first.

Once buildscad is installed:

```bash
buildscad pull
```
will download the unit conversion library dependency. You can then modify the files in the
`scad/assemblies/` folder to the desired sizes/labels. Once this is done you can run:

```bash
buildscad build
```
which will automatically export the stl, 3mf, and png renders of the blocks to the `./build`
directory.

*Note:* I used openscad-nightly for this. but it should be compatible with the regular release.
simply update the buildscad.properties file to point to your openscad executable.
