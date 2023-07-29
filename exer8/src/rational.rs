fn gcd(a: i64, b: i64) -> i64 {
    // Euclidean algorithm adapted from https://stackoverflow.com/questions/22281661/what-is-the-fastest-way-to-find-the-gcd-of-two-numbers
    let mut num1 = a;
    let mut num2 = b;
    while num2 != 0 {
        let temp = num1;
        num1 = num2;
        num2 = temp % num2;
    }
    return num1;
}

#[derive(Debug, Clone, PartialEq)]
pub struct Rational {
    pub n: i64,
    pub d: i64,
}

impl Rational {
    pub fn new(n: i64, d: i64) -> Rational {
        Rational {n, d}
    }
    pub fn reduce(&mut self) {
        let gcd = gcd(self.n, self.d);
        self.n /= gcd;
        self.d /= gcd;
    }
}

impl From<i64> for Rational {
    fn from(n: i64) -> Self {
        let d = 1;
        Rational {n, d}
    }
}

use std::fmt;
impl fmt::Display for Rational {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}/{}", self.n, self.d)
    }
}

impl From<Rational> for f64 {
    fn from(rt: Rational) -> f64 {
        rt.n as f64 / rt.d as f64
    }
}
