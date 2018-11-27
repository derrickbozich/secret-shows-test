// function for dynamic sorting
function compareValues(key, order='asc') {
  return function(a, b) {
  
    const varA = new Date(a)
    const varB = new Date(b)

    let comparison = 0;
    if (varA > varB) {
      comparison = 1;
    } else if (varA < varB) {
      comparison = -1;
    }
    return (
      (order == 'desc') ? (comparison * -1) : comparison
    );
  };
}
