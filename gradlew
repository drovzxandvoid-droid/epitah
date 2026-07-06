#!/bin/bash

# Gradle startup script for UN*X

...

APP_BASE_NAME=`basename "$0"`
APP_HOME="`pwd -P`"

# Resolve links: $0 may be a softlink
PRG="$0"
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/.." >&-
APP_HOME="`pwd -P`"
cd "$SAVED" >&-

# Add default JVM options
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != "max" to use that value.
MAX_FD="maximum"

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
pw=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NONSTOP* )
    nonstop=true
    ;;
esac

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD_LIMIT" != "unlimited" ] ; then
            NEW_FD=$((MAX_FD_LIMIT / 2))
            ulimit -n $NEW_FD
        fi
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    DEFAULT_JVM_OPTS="$DEFAULT_JVM_OPTS \"-Xdock:name=$APP_BASE_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# Escape application args
for i in "$@" ; do
    if [ -z "$var" ] ; then
        ARGS="\"$i\""
    else
        ARGS="$ARGS \"$i\""
    fi
done

eval set -- $ARGS

# Detect the Java command to use, providing a hint for where to find it.
JAVA_HOME=`javaPathToJs "$JAVA_HOME"`
java_cmd="java"
[ -n "$JAVA_HOME" ] && java_cmd="$JAVA_HOME/bin/java"

# Increase the maximum file descriptors if we can.
if [ ! -z "$MAX_FD" ] ; then
    if [ "$cygwin" = "true" ] ; then
        NEW_FD=`expr $MAX_FD \/ 2`
        ulimit -n $NEW_FD
    else
        ulimit -n $MAX_FD
    fi
fi

export GRADLE_OPTS="${GRADLE_OPTS:-$DEFAULT_JVM_OPTS}"

exec "$java_cmd" "${JVM_OPTS[@]}" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
