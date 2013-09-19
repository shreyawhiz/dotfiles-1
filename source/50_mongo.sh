if [ "$OSTYPE" =~ ^darwin ]; then
  # Starts mongodb
  alias mstart="launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist"

  # Stops mongodb
  alias mstop="launchctl unload -w ~/Library/LaunchAgents/org.mongodb.mongod.plist"
fi
