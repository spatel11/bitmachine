module Paths_bitmachine (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Stephen\\workspace\\haskell\\bitmachine\\.cabal-sandbox\\bin"
libdir     = "C:\\Users\\Stephen\\workspace\\haskell\\bitmachine\\.cabal-sandbox\\i386-windows-ghc-7.6.3\\bitmachine-0.0.0"
datadir    = "C:\\Users\\Stephen\\workspace\\haskell\\bitmachine\\.cabal-sandbox\\i386-windows-ghc-7.6.3\\bitmachine-0.0.0"
libexecdir = "C:\\Users\\Stephen\\workspace\\haskell\\bitmachine\\.cabal-sandbox\\bitmachine-0.0.0"
sysconfdir = "C:\\Users\\Stephen\\workspace\\haskell\\bitmachine\\.cabal-sandbox\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bitmachine_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bitmachine_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "bitmachine_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bitmachine_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bitmachine_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
