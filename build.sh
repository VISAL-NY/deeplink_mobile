
echo "[EXECUTE] flutter build web --no-tree-shake-icons"

flutter clean
flutter pub get
flutter build web --no-tree-shake-icons

echo "completed!";