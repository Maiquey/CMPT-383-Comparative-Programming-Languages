// Benchmark Relative speeds:
//
// Append:
// n=7/hailstone_sequence_append_7
// time:   [345.98 ns 348.47 ns 350.78 ns]
//
// Prealloc:
// n=7/hailstone_sequence_prealloc_7
// time:   [51.364 ns 51.885 ns 52.430 ns]

pub fn hailstone(n: u64) -> u64 {
    if n % 2 == 0 {
        n / 2
    } else {
        3*n + 1
    }
}

pub fn hailstone_sequence_append(n: u64) -> Vec<u64> {
    
    let mut hailstoneSequence = Vec::new();
    let mut nextHailstone = n;
    while nextHailstone != 1 {
        hailstoneSequence.push(nextHailstone);
        nextHailstone = hailstone(nextHailstone);
    }
    hailstoneSequence.push(nextHailstone);
    return hailstoneSequence;
}

pub fn hailstone_sequence_prealloc(n: u64) -> Vec<u64> {
    let hailLen = hailstone_length(n) + 1;
    let mut hailstoneSequence = Vec::with_capacity(hailLen);
    let mut nextHailstone = n;
    while nextHailstone != 1 {
        hailstoneSequence.push(nextHailstone);
        nextHailstone = hailstone(nextHailstone);
    }
    hailstoneSequence.push(nextHailstone);
    return hailstoneSequence;
}

pub fn hailstone_length(x: u64) -> usize {
    if x == 1 {
        return 0;
    }
    1 + hailstone_length(hailstone(x))
}
