//go:build mage

package main

import "github.com/magefile/mage/mg"

// Without Namespaces

// Builds something
func Build() error {
	return nil
}

// Tests something
func Test() error {
	return nil
}

var Default = Test

// With Namespaces

type Ns mg.Namespace

// Builds something different
func (Ns) Build() error {
	return nil
}

// Tests something different
func (Ns) Test() error {
	return nil
}
