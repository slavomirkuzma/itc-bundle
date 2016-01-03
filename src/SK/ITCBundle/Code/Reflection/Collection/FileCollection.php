<?php
namespace SK\ITCBundle\Code\Reflection\Collection;

use TokenReflection\ReflectionFile;
use SK\ITCBundle\Code\Reflection\Collection;

class FileCollection extends Collection
{

	/**
	 *
	 * @var ReflectionFile[]
	 */
	protected $elements;

	/**
	 *
	 * @var array
	 */
	protected $columns = array(
		"Files",
		"Owner",
		"Group",
		"Permissions",
		"Created",
		"Modified"
	);

	/**
	 * @return array
	 */
	public function toArray()
	{
		$rows = [];
		$currentDir = getcwd() . DIRECTORY_SEPARATOR;

		/* @var $reflection FileReflection  */
		foreach( $this->getIterator() as $reflection )
		{
			$row = [];

			$file = new \SplFileInfo( $reflection->getName() );

			$row = array(
				"Files" => str_replace( $currentDir, "", $file->getPathName() ),
				"Owner" => $file->getOwner(),
				"Group" => $file->getGroup(),
				"Permissions" => $file->getPerms(),
				"Created" => date( "d.m.Y h:m:s", $file->getCTime() ),
				"Modified" => date( "d.m.Y h:m:s", $file->getMTime() )
			);

			$rows[] = $row;
		}

		return $rows;
	}
}