extension MapNullSafeSetter<K, V> on Map<K, V> {
  void setIfNotNull(K key, V? value) {
    if (value != null) this[key] = value;
  }
}