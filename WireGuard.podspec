Pod::Spec.new do |s|
  s.name  = "WireGuard"

  s.version   = "0.0.20190610-13"
  s.summary   = "WireGuard apple version packed as pod and modified for AmpliFi Teleport app."
  s.homepage  = "https://github.com/UBNTRiga/wireguard-apple"
  s.license   = { :type => "MIT", :file => "COPYING" }
  s.author    = { "Andris Lejasmeiers" => "andris.lejasmeiers@ubnt.com" }

  s.platform      = :ios, "12.0"
  s.swift_version = "5.0"
  s.static_framework = true

  s.source        = {
    :git => "https://github.com/UBNTRiga/wireguard-apple.git",
    :branch => "amplifi"
  }

  s.source_files  = "wireguard-go-bridge/*.h", "WireGuard/WireGuard/WireGuardAppError.swift", "WireGuard/WireGuard/LocalizationHelper.swift", "WireGuard/Shared/**/*.*", "WireGuard/WireGuard/Crypto/", "WireGuard/WireGuard/Tunnel/", "WireGuard/WireGuard/UI/iOS/RecentTunnelsTracker.swift"
  s.exclude_files = "WireGuard/Shared/Logging/test_ringlogger.c"

  s.subspec 'NetworkExtension' do |ss|
    ss.vendored_libraries = "wireguard-go-bridge/lib/libwg-go.a"
   end

  s.framework     = "NetworkExtension"
end
