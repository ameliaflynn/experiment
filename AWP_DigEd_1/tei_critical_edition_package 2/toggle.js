function toggleWitness(witness) {
  document.querySelectorAll('.variant').forEach(function(variant) {
    variant.querySelectorAll('.rdg').forEach(function(rdg) {
      if (rdg.classList.contains('rdg-' + witness)) {
        rdg.classList.remove('hidden');
      } else {
        rdg.classList.add('hidden');
      }
    });
  });
}
