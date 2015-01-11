<?php
abstract class dbObject
{   
    const TABLE_NAME='undefined';
   
    public static function GetAll()
    {
        $c = get_called_class();
        return "SELECT * FROM `".$c::TABLE_NAME."`";
    }   
}
interface abc {
const jadu ='222';
//function ahaa();
}
class dbPerson extends dbObject implements abc

{
    const TABLE_NAME='persons';
}

class dbAdmin extends dbPerson
{
    const TABLE_NAME='admins';
}

echo dbObject::GetAll()."<br>";//output: "SELECT * FROM `persons`"
echo dbPerson::GetAll()."====".dbPerson::jadu."<br>";//output: "SELECT * FROM `persons`"
echo dbAdmin::GetAll()."<br>";//output: "SELECT * FROM `admins`"

die;

class BookSingleton {
    private $author = 'Gamma, Helm, Johnson, and Vlissides';
    private $title  = 'Design Patterns';
    private static $book = NULL;
    private static $isLoanedOut = FALSE;

    private function __construct() {
		
		$this->author="good boy";
    
	}

    static function borrowBook() {
      if (FALSE == self::$isLoanedOut) {
        if (NULL == self::$book) {
           self::$book = new BookSingleton();
        }
        self::$isLoanedOut = TRUE;
        return self::$book;
      } else {
        return NULL;
      }
    }

    function returnBook(BookSingleton $bookReturned) {
        self::$isLoanedOut = FALSE;
    }

    function getAuthor() {return $this->author;}

    function getTitle() {return $this->title;}

    function getAuthorAndTitle() {
      return $this->getTitle() . ' by ' . $this->getAuthor();
    }
  }
  
  $x=  BookSingleton::borrowBook();
  var_dump($x);
  
  $y=  BookSingleton::borrowBook();
  var_dump($y);
  
 ?>