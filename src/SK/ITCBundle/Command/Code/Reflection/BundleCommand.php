<?php

/**
 * SK ITC Bundle Code Bundle Reflection
 *
 * @licence GNU GPL
 *
 * @author Slavomir Kuzma <slavomir.kuzma@gmail.com>
 */
namespace SK\ITCBundle\Command\Code\Reflection;

use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class BundleCommand extends ReflectionCommand
{

	/**
	 * Constructs SK ITCBundle Command Namespace Abstract Reflection
	 *
	 * @param string $name
	 *        	SK ITCBundle Command Code Abstract Reflection Name
	 * @param string $description
	 *        	SK ITCBundle Command Code Abstract Reflection Description
	 */
	public function __construct(
		$name = "itc:reflection:bundles",
		$description = "ITC Reflection Bundles" )
	{

		parent::__construct(
			$name,
			$description );

	}

	/**
	 * (non-PHPdoc)
	 *
	 * @see \SK\ITCBundle\Code\Generator\PHPUnit\AbstractGenerator::execute($input, $output)
	 */
	public function execute(
		InputInterface $input,
		OutputInterface $output )
	{

		parent::execute(
			$input,
			$output );

	}

}