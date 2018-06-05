# Vim Tips #
## Search & Replace multiple files ##
1. Add files to buffer
   ```
   :argadd *.js
   ```

2. Replace __*foo*__ with __*bar*__
   ```
   :argdo %s/foo/bar/ge | update
   ```

## Open all files returned from grep ##
1. Open all found files as a separate buffer
   ```
   $ vim $(grep -lri 'pattern' .)
   ```

2. Navigate through buffers
   ```
   :next (or ]])
   :prev (or [[)
   ```
